// import "./SwitchPatient.css";
// import { Link } from "react-router-dom";
// import switchBlue from "../../assets/img/switchBlue.svg";
// import PageTitle from "../static/PageTitle/PageTitle";
// import SearchInput from "../static/Commons/CustomInput";
// import SearchIcon from "../../assets/img/SearchIcon.svg";
// import useSmartNavigate from "../../hooks/useSmartNavigate";
// import { useEffect, useState } from "react";
// import useApiClients from "../../services/useApiClients";
// import { FaPeopleGroup } from "react-icons/fa6";
// import { ReactComponent as GroupPeopleIcon } from "../../assets/img/GroupImgNew.svg";
// // import GroupPeopleIcon from "../../assets/img/GroupImgNew.svg";

// const SwitchPatient = () => {
//     const { smartNavigate } = useSmartNavigate({ scroll: "top" });
//     const [patients, setPatients] = useState([]);

//     const { api } = useApiClients();

//     const colors = [
//         "#e57373",
//         "#f06292",
//         "#ba68c8",
//         "#64b5f6",
//         "#4db6ac",
//         "#81c784",
//         "#ffb74d",
//         "#ff8a65",
//         "#a1887f",
//         "#90a4ae",
//         "#7986cb",
//         "#ff8c00",
//         "#008080",
//         "#556b2f",
//         "#8b0000",
//         "#9932cc",
//         "#ff1493",
//         "#008b8b",
//         "#006400",
//         "#b22222",
//         "#ff4500",
//         "#2e8b57",
//         "#8a2be2",
//         "#d2691e",
//         "#dc143c",
//         "#000080",
//     ];

//     const getColorForLetter = (letter) => {
//         const index = letter.toUpperCase().charCodeAt(0) - 65;
//         return colors[index] || "#000";
//     };

//     useEffect(() => {
//         const fetchPatients = async () => {
//             try {
//                 const res = await api.getPatientOrRelativeDropdown();
//                 const dataList =
//                     res?.response?.patientDropdowns ||
//                     res?.data?.patientDropdowns ||
//                     [];

//                 const mapped = (Array.isArray(dataList) ? dataList : []).map(
//                     (item) => ({
//                         name: item?.patientName,
//                         value: String(item?.patientId),
//                     }),
//                 );

//                 setPatients(mapped);
//             } catch (error) {
//                 console.error("Error fetching patients:", error);
//             }
//         };

//         fetchPatients();
//     }, []);

//     return (
//         <div className="col-12 col-md-7 mx-auto ">
//             <PageTitle backButton={true} pageName={""} switchButton={false} />
//             <div className="container justify-content-center">
//                 <SearchInput rightIcon={SearchIcon} placeholder="Search" />
//             </div>
//             <div className="link-container">
//                 <div
//                     className="switch-link"
//                     onClick={() => smartNavigate("/all-patient")}
//                 >
//                     <span className="grp-img"
//                         style={{
//                             color: "#4b3b8b",
//                         }}
//                     >
//                         <GroupPeopleIcon style={{ fill: "currentColor", width: "18px", height: "18px", marginBottom: "2px"}} />
//                     </span>
//                     &nbsp; &nbsp;
//                     <span className="switch-all-btn">All Patient</span>
//                 </div>
//             </div>
//             <div className="profile-menu">
//                 <div className="scroll-profile-menu">
//                     {/* <span className="pt-list">Patient List</span> */}
//                     {(patients.length ? patients : []).map((friend, index) => {
//                         const firstLetter = friend.name.charAt(0).toUpperCase();
//                         return (
//                             <li key={index} className="all-profile-item">
//                                 <div
//                                     className="profile-icon-circle"
//                                     style={{
//                                         backgroundColor:
//                                             getColorForLetter(firstLetter),
//                                     }}
//                                 >
//                                     {firstLetter}
//                                 </div>
//                                 <Link to={`/single-patient/${friend.value}`}>
//                                     &nbsp; &nbsp;{friend.name}
//                                 </Link>
//                             </li>
//                         );
//                     })}
//                 </div>
//             </div>
//         </div>
//     );

// };

// export default SwitchPatient;

// import "./SwitchPatient.css";
// import { Link } from "react-router-dom";
// import PageTitle from "../static/PageTitle/PageTitle";
// import SearchInput from "../static/Commons/CustomInput";
// import SearchIcon from "../../assets/img/SearchIcon.svg";
// import useSmartNavigate from "../../hooks/useSmartNavigate";
// import { useEffect, useState } from "react";
// import useApiClients from "../../services/useApiClients";

// // Small inline check SVG to avoid extra deps
// const CheckIcon = () => (
//   <svg width="12" height="9" viewBox="0 0 12 9" fill="none" xmlns="http://www.w3.org/2000/svg">
//     <path d="M10.6667 1L4.16675 7.5L1.33341 4.66667" stroke="white" strokeWidth="1.4" strokeLinecap="round" strokeLinejoin="round"/>
//   </svg>
// );

// const SwitchPatient = () => {
//   const { smartNavigate } = useSmartNavigate({ scroll: "top" });
//   const [patients, setPatients] = useState([]);
//   const [selectedId, setSelectedId] = useState(null);
//   const { api } = useApiClients();

//   const colors = [
//     "#e57373","#f06292","#ba68c8","#64b5f6","#4db6ac",
//     "#81c784","#ffb74d","#ff8a65","#a1887f","#90a4ae",
//     "#7986cb","#ff8c00","#008080","#556b2f","#8b0000",
//     "#9932cc","#ff1493","#008b8b","#006400","#b22222",
//     "#ff4500","#2e8b57","#8a2be2","#d2691e","#dc143c","#000080"
//   ];

//   const getColorForLetter = (letter) => {
//     if (!letter) return "#999";
//     const index = letter.toUpperCase().charCodeAt(0) - 65;
//     return colors[index] || "#666";
//   };

//   useEffect(() => {
//     const fetchPatients = async () => {
//       try {
//         const res = await api.getPatientOrRelativeDropdown();
//         const dataList = res?.response?.patientDropdowns || res?.data?.patientDropdowns || [];
//         const mapped = (Array.isArray(dataList) ? dataList : []).map(item => ({
//           id: String(item?.patientId),
//           name: item?.patientName || "Unknown",
//           avatar: item?.avatarUrl || null, // if backend provides image URL
//         }));
//         setPatients(mapped);
//         if (mapped.length) setSelectedId(mapped[0].id); // mark first as selected by default
//       } catch (error) {
//         console.error("Error fetching patients:", error);
//       }
//     };

//     fetchPatients();
//   }, [api]);

//   const handleSelect = (p) => {
//     setSelectedId(p.id);
//     // navigate to single patient page like your original code
//     smartNavigate(`/single-patient/${p.id}`);
//   };

//   return (
//     <div className="col-12 col-md-7 mx-auto switch-patient-page">
//       <PageTitle backButton={true} pageName={""} switchButton={false} />
//       <div className="container justify-content-center">
//         <SearchInput rightIcon={SearchIcon} placeholder="Search" />
//       </div>

//       <div className="switch-card">
//         <ul className="switch-list">
//           {/* Render fetched patients (limited height with scrolling if many) */}
//           {patients.length > 0 ? (
//             patients.map((p, idx) => {
//               const firstLetter = (p.name || "U").charAt(0).toUpperCase();
//               const isSelected = p.id === selectedId;
//               return (
//                 <li
//                   key={p.id}
//                   className={`switch-item ${isSelected ? "selected" : ""}`}
//                   onClick={() => handleSelect(p)}
//                 >
//                   <div className="left">
//                     {/* avatar: image if available else colored letter */}
//                     {p.avatar ? (
//                       <img src={p.avatar} alt={p.name} className="avatar-img" />
//                     ) : (
//                       <div
//                         className="avatar-circle"
//                         style={{ backgroundColor: getColorForLetter(firstLetter) }}
//                         aria-hidden
//                       >
//                         {firstLetter}
//                       </div>
//                     )}
//                     <div className="name-block">
//                       <div className="name">{p.name}</div>
//                       {/* optional subtitle — keep subtle to mimic screenshot feel */}
//                       <div className="sub">Patient</div>
//                     </div>
//                   </div>

//                   {/* check badge for selected */}
//                   {isSelected && (
//                     <div className="check-badge" aria-hidden>
//                       <CheckIcon />
//                     </div>
//                   )}
//                 </li>
//               );
//             })
//           ) : (
//             // placeholder when there are no patients yet
//             <li className="switch-item placeholder">
//               <div className="left">
//                 <div className="avatar-circle" style={{ backgroundColor: "#bdbdbd" }}>?</div>
//                 <div className="name-block">
//                   <div className="name">No patients</div>
//                   <div className="sub">Create or add a patient</div>
//                 </div>
//               </div>
//             </li>
//           )}

//           {/* Create profile entry (matches screenshot + sign) */}
//           <li
//             className="switch-item action create-action"
//             onClick={() => smartNavigate("/create-patient")}
//           >
//             <div className="left">
//               <div className="avatar-circle create">+</div>
//               <div className="name-block">
//                 <div className="name">Create Patient profile</div>
//               </div>
//             </div>
//           </li>

//           {/* Other accounts entry */}
//           <li
//             className="switch-item action other-action"
//             onClick={() => smartNavigate("/other-accounts")}
//           >
//             <div className="left">
//               <div className="avatar-circle small-avatars">
//                 {/* small stacked avatars visual (only decorative) */}
//                 <div className="dot dot-1" />
//                 <div className="dot dot-2" />
//               </div>
//               <div className="name-block">
//                 <div className="name">Other accounts</div>
//               </div>
//             </div>
//             <div className="chev">›</div>
//           </li>
//         </ul>

//         <div
//           className="accounts-centre"
//           onClick={() => smartNavigate("/accounts-centre")}
//         >
//           Go to Accounts Centre
//         </div>
//       </div>
//     </div>
//   );
// };

// export default SwitchPatient;

import "./SwitchPatient.css";
import PageTitle from "../static/PageTitle/PageTitle";
import SearchInput from "../static/Commons/CustomInput";
import SearchIcon from "../../assets/img/SearchIcon.svg";
import useSmartNavigate from "../../hooks/useSmartNavigate";
import { useEffect, useState } from "react";
import useApiClients from "../../services/useApiClients";
import { useLocalStorage } from "../../hooks/useLocalStorage";
import { ReactComponent as GroupPeopleIcon } from "../../assets/img/GroupImgNew.svg";

const CheckIcon = () => (
    // <svg width="20" height="12" viewBox="0 0 20 12" fill="none" xmlns="http://www.w3.org/2000/svg">
    //     <path d="M10.6667 1L4.16675 7.5L1.33341 4.66667" stroke="#4b3b8b" strokeWidth="2.4" strokeLinecap="round" strokeLinejoin="round" />
    // </svg>
    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
        <defs>
            <linearGradient id="grad" x1="0" y1="0" x2="24" y2="24" gradientUnits="userSpaceOnUse">
                <stop offset="0%" stop-color="#6C63FF" />
                <stop offset="100%" stop-color="#4b3b8b" />
            </linearGradient>
        </defs>
        <path d="M20 6L9 18L4 13" stroke="url(#grad)" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" />
    </svg>
);




const SwitchPatient = () => {
    const { smartNavigate } = useSmartNavigate({ scroll: "top" });
    const [patients, setPatients] = useState([]);
    const { api } = useApiClients();
    const [selectedPatientId, setSelectedPatientId] = useLocalStorage("selectedPatientId", "");

    const colors = [
        "#e57373", "#f06292", "#ba68c8", "#64b5f6", "#4db6ac",
        "#81c784", "#ffb74d", "#ff8a65", "#a1887f", "#90a4ae",
        "#7986cb", "#ff8c00", "#008080", "#556b2f", "#8b0000",
        "#9932cc", "#ff1493", "#008b8b", "#006400", "#b22222",
        "#ff4500", "#2e8b57", "#8a2be2", "#d2691e", "#dc143c", "#000080"
    ];

    const getColorForLetter = (letter) => {
        if (!letter) return "#999";
        const index = letter.toUpperCase().charCodeAt(0) - 65;
        return colors[index] || "#666";
    };

    useEffect(() => {
        const fetchPatients = async () => {
            try {
                const res = await api.getPatientOrRelativeDropdown();
                const dataList = res?.response?.patientDropdowns || res?.data?.patientDropdowns || [];
                const mapped = (Array.isArray(dataList) ? dataList : []).map(item => ({
                    id: String(item?.patientId),
                    name: item?.patientName || "Unknown",
                    avatar: item?.avatarUrl || null,
                }));
                setPatients(mapped);
                // if (mapped.length && !selectedPatientId) setSelectedPatientId(mapped[0].id); // default first selected
            } catch (error) {
                console.error("Error fetching patients:", error);
            }
        };
        fetchPatients();
    }, []);

    const handleSelect = (p) => {
        smartNavigate(`/single-patient/${p.id}`);
        setSelectedPatientId(p.id); // persist
    };

    return (
        <div className="col-12 col-md-7 mx-auto switch-patient-page">
            <PageTitle backButton={true} pageName={""} switchButton={false} />
            <div className="container justify-content-center">
                <SearchInput rightIcon={SearchIcon} placeholder="Search" />


                <div className="switch-card">
                    <ul className="switch-list">
                        <li className="switch-item" onClick={() => { smartNavigate("/all-patient"); setSelectedPatientId("") }}>
                            <div className="left">

                                <div className="avatar-img"
                                    style={{ color: "#4b3b8b" }}
                                >
                                    <GroupPeopleIcon style={{ fill: "currentColor", width: "39px", height: "30px", marginBottom: "2px" }} />
                                </div>

                                <span className="name">All Patient</span>
                            </div>
                            {!selectedPatientId && (
                                <div className="check-badge">
                                    <CheckIcon />
                                </div>
                            )}
                        </li>
                    </ul>
                </div>

                <div className="switch-card">
                    <ul className="switch-list">
                        {patients.map((p) => {
                            const name = p.name; // e.g., "John Doe"
                            const firstTwoLetters = name
                                .split(" ")                 // split name into words
                                .map(word => word.charAt(0).toUpperCase()) // get first letter of each word
                                .slice(0, 2)                // take max 2 letters
                                .join("");                  // join into a string
                            const firstLetter = name.charAt(0).toUpperCase();
                            const isSelected = p.id === selectedPatientId;
                            return (
                                <li
                                    key={p.id}
                                    className={`switch-item ${isSelected ? "selected" : ""}`}
                                    onClick={() => handleSelect(p)}
                                >
                                    <div className="left">
                                        {p.avatar ? (
                                            <img src={p.avatar} alt={p.name} className="avatar-img" />
                                        ) : (
                                            <div
                                                className="avatar-circle"
                                                style={{ backgroundColor: getColorForLetter(firstLetter) }}
                                            >
                                                {firstTwoLetters}
                                            </div>
                                        )}
                                        <span className="name">{p.name}</span>
                                    </div>

                                    {selectedPatientId && isSelected && (
                                        <div className="check-badge">
                                            <CheckIcon />
                                        </div>
                                    )}
                                </li>
                            );
                        })}

                        {/* <li className="switch-item action" onClick={() => smartNavigate("/create-patient")}>
                        <div className="left">
                            <div className="avatar-circle create">+</div>
                            <span className="name">Create Patient profile</span>
                        </div>
                    </li>

                    <li className="switch-item action" onClick={() => smartNavigate("/other-accounts")}>
                        <div className="left">
                            <div className="avatar-circle small-avatars">👥</div>
                            <span className="name">Other accounts</span>
                        </div>
                        <div className="chev">›</div>
                    </li> */}
                    </ul>

                    {/* <div
                    className="accounts-centre"
                    onClick={() => smartNavigate("/accounts-centre")}
                >
                    Go to Accounts Centre
                </div> */}
                </div>
            </div>
        </div>
    );
};

export default SwitchPatient;
