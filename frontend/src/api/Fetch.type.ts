import {PersonDto, PersonWithScoreDto} from "./PersonDtos.type";

export type fetchInput = {
    url: string,
    options?: { [key: string]: any }
}

export type fetchOutput = {
    isLoading: boolean,
    data: PersonDto[] | PersonDto | PersonWithScoreDto,
    errors: {}
}
