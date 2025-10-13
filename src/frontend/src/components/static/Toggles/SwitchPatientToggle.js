import React, { useState } from "react";
import "./SwitchPatientToggle.css";
import SwitchIcon from "../../../assets/img/SwitchIcon.svg";
import SwitchImg from "../../../assets/img/swich-user-icon-new.svg";
const SwitchPatientToggle = ({ pageName, onClick }) => {
    return (
        <>
            <div className="switch-patient-toggle-wrapper" onClick={onClick}>
                <input
                    className="switch-patient-toggle-input"
                    type="checkbox"
                    id="pin-toggle-SwitchPatientToggle"
                />
                <label
                    className="switch-patient-toggle-container"
                    htmlFor="pin-toggle-SwitchPatientToggle"
                >
                    <div className="switch-patient-toggle-square">
                        <div className="switch-patient-toggle-icon">
                            <img src={SwitchImg} alt="Switch Icon" />
                        </div>
                    </div>
                    <div className="d-flex justify-content-between switch-patient-label-container">
                        <div className="switch-patient-label-left"></div>
                        <div className="switch-patient-label-right">
                            Switch Patient
                        </div>
                    </div>
                    {/* <div className="user-specific-info-item">
                        {pageName
                            ? `User > ${pageName}`
                            : `User > Default Page`}
                    </div> */}
                </label>
            </div>
        </>
    );
};

export default SwitchPatientToggle;
