import React from 'react'

const PatientHistory = () => {
    const ptHistory = [
        { name: "line", value: "H/O Alternative Treatment &" },
        { name: "line", value: "H/O COVID (2022)-" },
        { name: "line", value: "Due to That Had A Stroke As Per Pt Was" },
        { name: "line", value: "On Medicine 2023" },
        { name: "line", value: "H/O Dengue (2024)," },
        { name: "line", value: "Presence Of Hernia In Right Side Of" },
        { name: "line", value: "Abdomen. Presence Of Hernia In Right" },
        { name: "line", value: "Of Abdomen." },
    ];

    return (
        <div className="ptHistory pt-3 pb-3">
            {ptHistory.map((entry, i) => (
                <div key={i} className="ptHistory-row">
                    <span className="ptHistory-value">
                        {entry.value}
                    </span>
                </div>
            ))}
        </div>
    )
}

export default PatientHistory
