import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';

// configureStore is used to apply preloadedState and middleware
const configureStore = () => (
    createStore(rootReducer)
);

export default configureStore;
