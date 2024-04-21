import React, {useContext, useEffect, useState} from 'react'
import ErrorDefaultMessage from "../components/ErrorDefaultMessage";
import TableRow from "../components/TableRow";
import {ErrorBoundary} from "react-error-boundary";
import ModalCreatePerson from "../components/persons/ModalCreatePerson";
import PersonContext from "../Contexts/PersonContext";
import ModalSearchPerson from "../components/persons/ModalSearchPerson";


const PersonPage: React.FunctionComponent = () => {

    const personContext = useContext(PersonContext)

    const [persons, setPersons] = useState([...personContext.persons])
    const [isLoading, setIsLoading] = useState(personContext.isLoading)

    useEffect(() => {
        setPersons([...personContext.persons])
        setIsLoading(personContext.isLoading)
    }, [personContext.persons, personContext.isLoading])

    return <>
        <div className="row mb-2">
            <h1 className="col-md-7">Persons registered</h1>
        </div>
        <div className="row">
            <h6 className="col-md-5 offset-md-8">
                <button type="button" className="btn btn-primary mr-1" data-toggle="modal" data-target="#creationModal">
                    CREATE NEW PERSON
                </button>
                <button type="button" className="btn btn-primary" data-toggle="modal" data-target="#SearchModal">
                    SEARCH PERSON
                </button>
            </h6>
        </div>

        <div className="row">
            <div className="col-md-12">
                <ErrorBoundary FallbackComponent={ErrorDefaultMessage}>

                    <table className="table">
                        <thead>
                        <tr>
                            <th scope="col">#IDENTITY</th>
                            <th scope="col">firstname</th>
                            <th scope="col">lastname</th>
                            <th scope="col">birth date</th>
                        </tr>
                        </thead>
                        <tbody>
                        {isLoading && <tr>
                            <td>chargement en cours ...</td>
                        </tr>}
                        {!isLoading && <TableRow persons={persons}/>}
                        </tbody>
                    </table>
                    <ModalCreatePerson/>
                    <ModalSearchPerson/>
                </ErrorBoundary>
            </div>
        </div>
    </>
}

export default PersonPage