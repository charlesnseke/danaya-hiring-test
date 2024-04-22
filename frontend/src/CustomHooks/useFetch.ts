import {useEffect, useState} from "react";
import {fetchInput, fetchOutput} from "../api/Fetch.type";
import fetchApi from "../http/Fetch";
import {PersonDto} from "../api/PersonDtos.type";

const useFetch: (input: fetchInput) => fetchOutput = ({url, options}) => {

    const [isLoading, setIsLoading] = useState(true)
    const [data, setData] = useState([])
    const [errors, setErrors] = useState(null)

    useEffect(() => {
        fetchApi({url, options})
            .then((response: fetchOutput) => {
                setData(response.data as PersonDto[])
                setErrors(response.errors)
                setIsLoading(response.isLoading)
            })
    }, [url])

    return {
        isLoading,
        data: data as [],
        errors
    }
}

export default useFetch