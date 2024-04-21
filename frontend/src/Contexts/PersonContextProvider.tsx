import React, {useContext, useEffect, useState} from "react";
import useFetch from "../CustomHooks/useFetch";
import config from "../http/Config";
import PersonContext from "./PersonContext";

const PersonContextProvider: React.FunctionComponent = ({children}) => {

    const personContext = useContext(PersonContext)

    const {
        isLoading,
        data
    } = useFetch({url: config.findAllPaginated(0, 2)})
    const [persons, setPersons] = useState(data)
    const [isLoadingPerson, setIsLoadingPerson] = useState(isLoading)

    useEffect(() => {
        setPersons([...data])
        setIsLoadingPerson(isLoading)
    }, [data, isLoading])


    const updatePersons = (newPerson) => {
        setPersons([...persons, newPerson])
        setIsLoadingPerson(false);
    };

    return <>
        <PersonContext.Provider
            value={{...personContext, persons: [...persons], isLoading: isLoadingPerson, updatePersons: updatePersons}}>
            {children}
        </PersonContext.Provider>
    </>
}

export default PersonContextProvider;