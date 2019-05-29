import "bootstrap";
import flatpickr from 'flatpickr';
window.flatpickr = flatpickr;
import 'flatpickr/dist/flatpickr.min.css';

import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();
import { initStarRating } from '../plugins/init_star_rating';

global.initStarRating = initStarRating;

initStarRating();
