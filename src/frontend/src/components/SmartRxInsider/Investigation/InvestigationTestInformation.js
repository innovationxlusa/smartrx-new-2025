const InvestigationTestInformation = ({
    data,
    selectedInvestigationId,
    isLoading,
    error,
}) => {
    return (
        <div className="faq-container p-2">
            <div
                className="mb-4"
                style={{
                    fontSize: "17px",
                    fontFamily:
                        "Bangla, Noto Sans Bengali, SolaimanLipi, sans-serif",
                }}
            >
                Test Information - FAQs
            </div>
            <div className="accordion" id="testFAQAccordion">
                {isLoading ? (
                    Array(4)
                        .fill(0)
                        .map((_, idx) => (
                            <div key={idx} className="col-md-10 col-lg-8 mb-4">
                                <div className="faq-shimmer-card p-4 rounded-4 position-relative">
                                    <div>
                                        <div className="faq-shimmer faq-shimmer-title mb-3" />
                                        <div className="faq-shimmer faq-shimmer-line mb-2" />
                                        <div className="faq-shimmer faq-shimmer-line mb-2" />
                                        <div className="faq-shimmer faq-shimmer-line" />
                                    </div>
                                    <div>
                                        <div className="faq-shimmer faq-shimmer-title mb-3" />
                                        <div className="faq-shimmer faq-shimmer-line mb-2" />
                                        <div className="faq-shimmer faq-shimmer-line mb-2" />
                                        <div className="faq-shimmer faq-shimmer-line" />
                                    </div>
                                    <div>
                                        <div className="faq-shimmer faq-shimmer-title mb-3" />
                                        <div className="faq-shimmer faq-shimmer-line mb-2" />
                                        <div className="faq-shimmer faq-shimmer-line mb-2" />
                                        <div className="faq-shimmer faq-shimmer-line" />
                                    </div>
                                    <div>
                                        <div className="faq-shimmer faq-shimmer-title mb-3" />
                                        <div className="faq-shimmer faq-shimmer-line mb-2" />
                                        <div className="faq-shimmer faq-shimmer-line mb-2" />
                                        <div className="faq-shimmer faq-shimmer-line" />
                                    </div>
                                </div>
                            </div>
                        ))
                ) : Array.isArray(data?.investigationFAQs) &&
                  data?.investigationFAQs.length > 0 ? (
                    data?.investigationFAQs.map(
                        ({ id, question, answer }, index) => (
                            <div className="accordion-item" key={id}>
                                <h2
                                    className="accordion-header"
                                    id={`heading-${id}`}
                                >
                                    <button
                                        className={`accordion-button ${
                                            index !== 0 ? "collapsed" : ""
                                        }`}
                                        type="button"
                                        data-bs-toggle="collapse"
                                        data-bs-target={`#collapse-${id}`}
                                        aria-expanded={
                                            index === 0 ? "true" : "false"
                                        }
                                        aria-controls={`collapse-${id}`}
                                        style={{ fontSize: "15px" }}
                                    >
                                        {question}
                                    </button>
                                </h2>
                                <div
                                    id={`collapse-${id}`}
                                    className={`accordion-collapse collapse ${
                                        index === 0 ? "show" : ""
                                    }`}
                                    aria-labelledby={`heading-${id}`}
                                    data-bs-parent="#testFAQAccordion"
                                >
                                    <div
                                        className="accordion-body text-start"
                                        style={{
                                            fontSize: "13px",
                                            textAlign: "justify",
                                        }}
                                    >
                                        {answer}
                                    </div>
                                </div>
                            </div>
                        )
                    )
                ) : (
                    <p
                        className="text-center text-muted"
                        style={{ fontFamily: "Georama" }}
                    >
                        No FAQs available for this Test Center.
                    </p>
                )}
            </div>
        </div>
    );
};

export default InvestigationTestInformation;
