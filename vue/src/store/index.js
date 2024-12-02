import { createStore as _createStore } from 'vuex';
import axios from 'axios';

export function createStore(currentToken, currentUser) {
  let store = _createStore({
    state: {
      token: currentToken || '',
      user: currentUser || {},

      plants: [
        {
            "id": 1,
            "name": "Rose",
            "type": "Flowering Plant"
        },
        {
            "id": 2,
            "name": "Lavender",
            "type": "Herb"
        },
        {
            "id": 3,
            "name": "Tomato",
            "type": "Vegetable"
        },
        {
            "id": 4,
            "name": "Tulip",
            "type": "Flowering Plant"
        },
        {
            "id": 5,
            "name": "Basil",
            "type": "Herb"
        }
    ]
    },
    mutations: {
      SET_AUTH_TOKEN(state, token) {
        state.token = token;
        localStorage.setItem('token', token);
        axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
      },
      SET_USER(state, user) {
        state.user = user;
        localStorage.setItem('user', JSON.stringify(user));
      },
      LOGOUT(state) {
        localStorage.removeItem('token');
        localStorage.removeItem('user');
        state.token = '';
        state.user = {};
        axios.defaults.headers.common = {};
      }
    },
  });
  return store;
}
