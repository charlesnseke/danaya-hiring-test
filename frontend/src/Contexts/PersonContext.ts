import {createContext} from "react";
import {PersonDto} from "../api/PersonDtos.type";


export const PersonContext = createContext({
    persons: [] as PersonDto[],
    isLoading: false,
    errors: {},
    addPerson: () => {
    },
    updatePersons: (newPerson: PersonDto) => {
    }
})

export default PersonContext;