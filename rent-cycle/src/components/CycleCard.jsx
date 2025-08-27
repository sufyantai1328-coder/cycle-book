import React from 'react'

const CycleCard = ({ cycle, onBookNow }) => {
  return (
    <div className="cycle-card">
      <img 
        src={cycle.image} 
        alt={cycle.name}
        className="cycle-image"
        onError={(e) => {
          e.target.src = 'https://images.unsplash.com/photo-1485965120184-e220f721d03e?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60'
        }}
      />
      <h3 className="cycle-name">{cycle.name}</h3>
      <p className="cycle-type">Type: {cycle.type}</p>
      <p className="cycle-price">₹{cycle.pricePerHour}/hour</p>
      <p style={{ color: '#666', marginBottom: '1rem' }}>{cycle.description}</p>
      <button 
        className="btn" 
        onClick={() => onBookNow(cycle)}
        style={{ width: '100%' }}
      >
        Book Now
      </button>
    </div>
  )
}

export default CycleCard
