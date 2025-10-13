import { useState, useRef, useEffect } from "react";
import "./CustomSelect.css";
import { FaChevronDown } from "react-icons/fa";

const CustomSelect = ({
  id,
  label,
  labelPosition = "top-left",
  options = [],
  placeholder = "",
  onChange,
  value,
  name,
  icon,
  iconTwo,
  error,
  className,
  disabled = false,
  bgColor = "#f9f9f9",
  textColor = "#65636e",
  width = "100%",
  borderRadius = "8px",
  borderColors = "1px solid #65636e",
  dropdownTrayHight = "80%",
}) => {
  const [isOpen, setIsOpen] = useState(false);
  const ref = useRef();

  const selectedOption = options.find((opt) => opt.value === value);

  const styleVars = {
    "--custom-bg": bgColor,
    "--custom-text": textColor || "#333",
    "--custom-width": width,
    "--custom-radius": borderRadius,
    "--custom-border": borderColors,
  };

  const handleSelect = (option) => {
    const fakeEvent = { target: { name, value: option.value } };
    onChange(fakeEvent);
    setIsOpen(false);
  };

  const toggleDropdown = () => {
    if (!disabled) {
      setIsOpen((prev) => !prev);
    }
  };

  useEffect(() => {
    const handleClickOutside = (event) => {
      if (ref.current && !ref.current.contains(event.target)) {
        setIsOpen(false);
      }
    };
    document.addEventListener("mousedown", handleClickOutside);
    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, []);

  return (
    <div className={`select-flex-wrapper ${className || ""}`}>
      <div id={id} className="custom-select-wrapper">
        {label && (
          <label
            htmlFor={id}
            className={`custom-select-label ${labelPosition}`}
          >
            {label}
          </label>
        )}
        <input type="hidden" name={name} value={value || ""} />
        <div className="custom-select-container" style={styleVars} ref={ref}>
          <div
            className={`custom-select-display ${isOpen ? "focused" : ""} ${
              disabled ? "disabled" : ""
            }`}
            style={{
              paddingLeft: icon ? "2.5rem" : iconTwo ? "20px" : "8px",
              paddingRight: "2.5rem",
            }}
            onClick={toggleDropdown}
            tabIndex={0}
          >
            {icon && <span className="select-icon left">{icon}</span>}
            <span
              className="selected-value"
              style={{ marginLeft: icon ? "8px" : "0" }}
            >
              {selectedOption?.label || placeholder}
            </span>
            <span className="select-icon right">
              <FaChevronDown />
            </span>
          </div>

          {isOpen && (
            <div
              className="custom-select-options"
              style={{
                maxHeight: "200px",
                overflowY: "auto",
              }}
            >
              {options.map((option) => (
                <div
                  key={option.value}
                  className={`custom-select-option ${
                    option.value === value ? "selected" : ""
                  }`}
                  onClick={() => handleSelect(option)}
                >
                  {option.label}
                </div>
              ))}
            </div>
          )}
        </div>
        {error && <p className="error-message mb-0">{error}</p>}
      </div>
    </div>
  );
};

export default CustomSelect;
