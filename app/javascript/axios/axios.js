import axios from 'axios';

let csrfToken = document
  .querySelector('meta[name="csrf-token"]')
  .getAttribute('content');

const axiosInstance = axios.create({
  baseURL: 'api/v1/',
  headers: { 'X-CSRF-Token': csrfToken }
});

export default axiosInstance;
