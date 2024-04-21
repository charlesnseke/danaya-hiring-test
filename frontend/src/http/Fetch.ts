import {fetchInput, fetchOuput} from "../api/Fetch.type";

const fetchApi: (params: fetchInput) => Promise<fetchOuput> = async ({url, options}) => {
    let isLoading: boolean;
    let data = [];
    let errors = {}
    try {
        const response = await fetch(url, {...options})
        if (response.status >= 200 && response.status < 300)
            data = await response.json()
        else
            errors = await response.json()
    } catch (error: any) {
        errors = error
    } finally {
        isLoading = false
    }
    return {isLoading, data, errors}
}

export default fetchApi