import { useState } from "react";
import "./CustomCarousel.css";
import SliderImage1 from "../../../assets/img/SliderImage-1.svg";
import SliderImage2 from "../../../assets/img/SliderImage-2.svg";
import SliderImage3 from "../../../assets/img/SliderImage-3.svg";

const slides = [
    {
        title: "Your Prescription Archive –",
        subtitle: "A Smarter Way to Store and Access Your Health Records.",
        image: SliderImage1,
    },
    {
        title: "Digital Health Vault –",
        subtitle: "Securely manage all your medical history in one place.",
        image: SliderImage2,
    },
    {
        title: "Instant Access –",
        subtitle: "Retrieve your prescriptions anytime, anywhere.",
        image: SliderImage3,
    },
];

const CustomCarousel = () => {
    const [current, setCurrent] = useState(0);
    const [transitioning, setTransitioning] = useState(false);

    const goToSlide = (index) => {
        if (index === current || transitioning) return;
        setTransitioning(true);
        setTimeout(() => {
            setCurrent(index);
            setTransitioning(false);
        }, 300); // Match animation duration
    };

    return (
        <div className="smart-slider">
            <div className={`slide-content ${transitioning ? "fade-out" : "fade-in"}`}>
                <div className="image-wrapper">
                    <img src={slides[current].image} alt="slide" className="slide-image" />
                </div>
                <h3 className="slide-title">{slides[current].title}</h3>
                <p className="slide-subtitle">{slides[current].subtitle}</p>
            </div>

            <div className="slide-dots">
                {slides.map((_, i) => (
                    <div key={i} className={`dot ${i === current ? "active" : ""}`} onClick={() => goToSlide(i)} />
                ))}
            </div>
        </div>
    );
};

export default CustomCarousel;
