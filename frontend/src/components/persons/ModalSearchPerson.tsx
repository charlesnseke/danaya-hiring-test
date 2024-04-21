import React, {useState} from "react"
import {PersonDto, PersonWithScoreDto} from "../../api/PersonDtos.type";
import moment from "moment";
import config from "../../http/Config";
import fetchApi from "../../http/Fetch";
import ProgressBar from "../ProgressBar";

const inputDateFormat = "YYYY-MM-DD"
const dateFormat = "DD-MM-YYYY"
const today = moment().format(dateFormat);

const ModalSearchPerson: React.FunctionComponent = () => {

    const initData = () => {
        setPersonWithScore({} as PersonWithScoreDto)
        setIsLoading(false)
        setErrors({})
        setIsSubmitted(false)
        const form = document.getElementById('SearchModal');
        form?.reset()
    }

    const [personWithScore, setPersonWithScore] = useState({} as PersonWithScoreDto)
    const [isLoading, setIsLoading] = useState(false)
    const [errors, setErrors] = useState({})
    const [isSubmitted, setIsSubmitted] = useState(false)


    const queryString = (person: PersonDto) => Object.entries(person)
        .map(([key, value]) => `${encodeURIComponent(key)}=${encodeURIComponent(value)}`)
        .join('&');

    const savedData = async (event: any) => {
        event.preventDefault()

        setIsLoading(true)

        const data = new FormData(event.target)
        const person = {
            identity: data.get("identity"),
            firstName: data.get("firstName"),
            lastName: data.get("lastName"),
            birthDate: moment(data.get("birthDate"), inputDateFormat).format(dateFormat)
        } as PersonDto

        const response = await fetchApi({url: config.findPersonByCriteriaWithScore() + queryString(person)})
        console.log(response, "data")
        setPersonWithScore(response.data as PersonWithScoreDto)
        setErrors(response.errors)
        setIsLoading(false)
        setIsSubmitted(true)
    }


    return <>
        <form onSubmit={(event) => savedData(event)} className="modal fade" id="SearchModal" tabIndex={-1} role="dialog"
              aria-labelledby="exampleModalSearchLabel" aria-hidden="true">
            <div className="modal-dialog" role="document">
                <div className="modal-content">
                    <div className="modal-header d-flex flex-column">

                        <div className="w-100 d-flex">
                            <h5 className="modal-title" id="exampleModalLabel">Search an person</h5>
                            <button type="button" className="close" onClick={initData} data-dismiss="modal"
                                    aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        {isSubmitted && <div
                            className={!('detail' in errors) ? 'alert alert-success w-100' : 'alert alert-danger w-100'}
                            role="alert">
                            {'detail' in errors && errors['detail']}
                            {!('detail' in errors) && "person find successfully"}
                        </div>}

                    </div>
                    <div className="modal-body">

                        <div className="form-group">
                            <label htmlFor="inputName">identity</label>
                            <input type="text" name="identity" className="form-control" id="firstName"
                                   aria-describedby="emailHelp" placeholder="ID818791"/>
                        </div>


                        <div className="form-group">
                            <label htmlFor="inputName">firstname</label>
                            <input type="text" name="firstName" className="form-control" id="firstName"
                                   aria-describedby="emailHelp" placeholder="Albert"/>
                            <ProgressBar personWithScore={personWithScore} fieldName="firstNameWithScore"/>
                        </div>


                        <div className="form-group">
                            <label htmlFor="inputColor">lastname</label>
                            <input type="text" name="lastName" className="form-control" id="lastName"
                                   placeholder="Toro"/>
                            <ProgressBar personWithScore={personWithScore} fieldName="lastNameWithScore"/>
                        </div>


                        <div className="form-group">
                            <label htmlFor="inputCapacity">BirthDay</label>
                            <input type="date" name="birthDate" className="form-control" data-date-format="DD-MM-YYYY"
                                   id="birthDate" max={today}/>
                            <ProgressBar personWithScore={personWithScore} fieldName="birthDateWithScore"/>
                        </div>


                        {isLoading && 'chargement...'}
                        {!isLoading && <button type="submit" className="btn btn-primary"> Enregistrer </button>}
                    </div>
                </div>
            </div>
        </form>
    </>
}

export default ModalSearchPerson