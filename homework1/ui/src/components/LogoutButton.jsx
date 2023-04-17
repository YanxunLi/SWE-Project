import React from 'react';

const LogoutButton = () => {
  const handleClick = () => {
    // TODO: Perform logout action here, removing the username from local storage
    // Redirect the user to the login page
    // Remove the username from local storage
    localStorage.removeItem('username');

    // Redirect the user to the login page
    window.location.href = '/';
  };

  return (
    <button onClick={handleClick}>Logout</button>
  );
};

export default LogoutButton;