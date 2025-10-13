import BmiChart from "../static/BmiChart/BmiChart";
import PulseRateGraph from "../static/Graph/PulseRateGraph";
import SinglePatient from "../static/SinglePatient/SinglePatient";
import StarRating from "../static/StarRating/StarRating";
import SearchByDateRange from "../static/SearchByDateRange/SearchByDateRange";


const SampleOfAbuBakar = () => {

    return (
        <>
            <SinglePatient />   
            <PulseRateGraph />
            <StarRating />
            <SearchByDateRange/>    
            <BmiChart />
        </>
    );
};

export default SampleOfAbuBakar;