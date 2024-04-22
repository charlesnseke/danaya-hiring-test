export interface CreatePersonDto {
    firstName: String,
    lastName: String,
    birthDate: String
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