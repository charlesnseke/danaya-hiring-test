export interface CreatePersonDto {
    firstName: String,
    lastName: String,
    birthDate: String
}

export interface GetPersonDto extends CreatePersonDto {
    identity: string,
}

export interface PersonDto extends CreatePersonDto {
    identity: string
}

type ScoreField = {
    field: string,
    score: number
}

export interface PersonWithScoreDto {
    firstNameWithScore: ScoreField;
    lastNameWithScore: ScoreField;
    birthDateWithScore: ScoreField;
}