import { useEffect } from 'react';
import { useLocation } from 'react-router-dom';

export default function ScrollToTop({ offset = 10 }) {
    const { pathname } = useLocation();

    useEffect(() => {
        // console.log('📜 Navigated to', pathname, '→ scrolling top element');

        // Find the target element (can be body, root, or any specific container)
        const target = document.querySelector('.main-scroll-container'); // or any selector you want
        if (target) {
            // console.log('⬆️ Scrolling to top of', target);
            target.scrollIntoView({ behavior: 'smooth', block: 'start', });
        } else {
            // fallback to top of window
            window.scrollTo({ top: 0, left: 0, behavior: 'smooth' });
        }
    }, [pathname, offset]);

    return null;
}
