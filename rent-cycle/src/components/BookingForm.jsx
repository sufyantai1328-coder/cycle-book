import React, { useState } from 'react'

const BookingForm = ({ cycle, onSubmit, onClose }) => {
  const [customerName, setCustomerName] = useState('')
  const [customerEmail, setCustomerEmail] = useState('')
  const [customerPhone, setCustomerPhone] = useState('')
  const [startTime, setStartTime] = useState('')
  const [endTime, setEndTime] = useState('')

  const handleSubmit = (e) => {
    e.preventDefault()
    const bookingData = {
      customerName,
      customerEmail,
      customerPhone,
      startTime,
      endTime
    }
    onSubmit(bookingData)
  }

  return (
    <div className="booking-form">
      <h2>Book {cycle.name}</h2>
      <form onSubmit={handleSubmit}>
        <div className="form-group">
          <label htmlFor="customer_name">Full Name:</label>
          <input 
            type="text" 
            id="customer_name" 
            value={customerName} 
            onChange={(e) => setCustomerName(e.target.value)} 
            required 
          />
        </div>
        <div className="form-group">
          <label htmlFor="customer_email">Email:</label>
          <input 
            type="email" 
            id="customer_email" 
            value={customerEmail} 
            onChange={(e) => setCustomerEmail(e.target.value)} 
            required 
          />
        </div>
        <div className="form-group">
          <label htmlFor="customer_phone">Phone:</label>
          <input 
            type="tel" 
            id="customer_phone" 
            value={customerPhone} 
            onChange={(e) => setCustomerPhone(e.target.value)} 
            required 
          />
        </div>
        <div className="form-group">
          <label htmlFor="start_time">Start Time:</label>
          <input 
            type="datetime-local" 
            id="start_time" 
            value={startTime} 
            onChange={(e) => setStartTime(e.target.value)} 
            required 
          />
        </div>
        <div className="form-group">
          <label htmlFor="end_time">End Time:</label>
          <input 
            type="datetime-local" 
            id="end_time" 
            value={endTime} 
            onChange={(e) => setEndTime(e.target.value)} 
            required 
          />
        </div>
        <button type="submit">Confirm Booking</button>
        <button type="button" onClick={onClose}>Cancel</button>
      </form>
    </div>
  )
}

export default BookingForm
