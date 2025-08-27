import React from 'react'
import CycleCard from './CycleCard'

const CycleList = ({ cycles, onBookNow }) => {
  return (
    <section id="cycles">
      <h2 style={{ textAlign: 'center', marginBottom: '2rem', fontSize: '2.5rem', color: '#333' }}>
        Available Cycles
      </h2>
      <div className="cycles-grid">
        {cycles.map(cycle => (
          <CycleCard
            key={cycle.id}
            cycle={cycle}
            onBookNow={onBookNow}
          />
        ))}
      </div>
    </section>
  )
}

export default CycleList
