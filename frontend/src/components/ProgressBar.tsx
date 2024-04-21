import React from "react";
import {PersonWithScoreDto} from "../api/PersonDtos.type";

const ProgressBar: React.FunctionComponent<{ personWithScore: PersonWithScoreDto, fieldName: string }> = ({
                                                                                                              personWithScore,
                                                                                                              fieldName
                                                                                                          }) => {

    return <>
        {'lastNameWithScore' in personWithScore && <div className="progress mt-1">
            <div className="progress-bar" role="progressbar" style={{width: personWithScore[fieldName].score + "%"}}
                 aria-valuenow={personWithScore[fieldName].score}
                 aria-valuemin={0} aria-valuemax={100}>{personWithScore[fieldName].score + "%"}
            </div>
        </div>}
    </>
}

export default ProgressBar