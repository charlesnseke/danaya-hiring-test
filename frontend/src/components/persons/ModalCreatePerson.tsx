import React, {useContext, useState} from "react"
import {CreatePersonDto, PersonDto} from "../../api/PersonDtos.type";
import moment from "moment";
import PersonContext from "../../Contexts/PersonContext";
import config from "../../http/Config";
import fetchApi from "../../http/Fetch";

const inputDateFormat = "YYYY-MM-DD"
const dateFormat = "DD-MM-YYYY"
const today = moment().format(dateFormat);

const ModalCreatePerson: React.FunctionComponent = () => {


    const initData = () => {
        setPersons([] as PersonDto[])
        setIsLoading(false)
        setErrors({})
        setIsSubmitted(false)
        const form = document.getElementById('creationModal');
        form?.reset()
    }

    const personContext = useContext(PersonContext);
    const [persons, setPersons] = useState(personContext.persons)
    const [isLoading, setIsLoading] = useState(false)
    const [errors, setErrors] = useState({})
    const [isSubmitted, setIsSubmitted] = useState(false)

    const savedData = async (event: any) => {
        event.preventDefault()

        setIsLoading(true)
        const data = new FormData(event.target)
        const person = {
            firstName: data.get("firstName"),
            lastName: data.get("lastName"),
            birthDate: moment(data.get("birthDate"), inputDateFormat).format(dateFormat)
        } as CreatePersonDto

        const response = await fetchApi({
            url: config.addNewUser(), options: {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(person)
            }
        })

        setPersons([...persons, response.data as PersonDto])
        setErrors(response.errors)
        setIsLoading(false)
        setIsSubmitted(true)
        personContext.updatePersons(response.data as PersonDto)
    }


    return <>
        <PersonContext.Provider value={{...personContext, persons: [...persons]}}>
            <form onSubmit={(event) => savedData(event)} className="modal fade" id="creationModal" tabIndex={-1}
                  role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div className="modal-dialog" role="document">
                    <div className="modal-content">
                        <div className="modal-header d-flex flex-column">

                            <div className="w-100 d-flex">
                                <h5 className="modal-title" id="exampleModalLabel">Create an person</h5>
                                <button type="button" className="close" onClick={initData} data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            {isSubmitted && <div
                                className={!('detail' in errors) ? 'alert alert-success w-100' : 'alert alert-danger w-100'}
                                role="alert">
                                {'detail' in errors && errors['detail']}
                                {!('detail' in errors) && "user registered successfully"}
                            </div>}

                        </div>
                        <div className="modal-body">
                            <div className="form-group">
                                <label htmlFor="inputName">firstname</label>
                                <input type="text" name="firstName" className="form-control" id="firstName"
                                       aria-describedby="emailHelp" placeholder="Albert"/>
                            </div>

                            <div className="form-group">
                                <label htmlFor="inputColor">lastname</label>
                                <input type="text" name="lastName" className="form-control" id="lastName"
                                       placeholder="Toro"/>
                            </div>

                            <div className="form-group">
                                <label htmlFor="inputCapacity">BirthDay</label>
                                <input type="date" name="birthDate" className="form-control"
                                       data-date-format="DD-MM-YYYY" id="birthDate" max={today}/>
                            </div>

                            {isLoading && 'chargement...'}
                            {!isLoading && <button type="submit" className="btn btn-primary"> Enregistrer </button>}
                        </div>
                    </div>
                </div>
            </form>
        </PersonContext.Provider>
    </>
}

export default ModalCreatePerson