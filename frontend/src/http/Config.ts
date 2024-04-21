const baseUrl = "http://localhost:8081/api/v1/persons"

const endpoints = {
    addNewUser: () => baseUrl,
    findAllPaginated: (pageNumber: number, pageSize: number) => baseUrl + "?pageSize=" + pageSize + "&pageNumber=" + pageNumber,
    findPersonByCriteriaWithScore: () => baseUrl + "/getScore?"
}

export default endpoints;