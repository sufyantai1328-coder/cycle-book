import React from 'react'

const Header = () => {
  return (
    <header className="header">
      <div className="container">
        <nav className="nav">
          <div className="logo">CycleBook</div>
          <ul className="nav-links">
            <li><a href="#home">Home</a></li>
            <li><a href="#cycles">Cycles</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
          </ul>
        </nav>
      </div>
    </header>
  )
}

export default Header
