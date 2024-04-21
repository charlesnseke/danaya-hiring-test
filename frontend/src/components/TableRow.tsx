import React from 'react';
import {PersonDto} from "../api/PersonDtos.type";

const TableRow: React.FunctionComponent<{ persons: PersonDto[] }> = ({persons}) => {
    return (
        <>
            {persons.map((person: PersonDto) => {
                return (
                    <tr key={person.identity}>
                        <th scope="row">{person.identity}</th>
                        <td>{person.firstName}</td>
                        <td>{person.lastName}</td>
                        <td>{person.birthDate}</td>
                    </tr>
                );
            })}
        </>
    );
}

export default TableRow;
