export const formatDate = (value) => {
  const dt = new Date(value);
  const y = dt.getFullYear();
  const m = ('00' + (dt.getMonth() + 1)).slice(-2);
  const d = ('00' + dt.getDate()).slice(-2);
  return y + m + d;
};

export const calcAge = (value) => {
  const today = new Date();
  const formated_today = formatDate(today);
  const birth = formatDate(value);
  return Math.floor((parseInt(formated_today) - parseInt(birth)) / 10000);
};
