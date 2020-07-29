import React, { useContext, useEffect } from 'react';
import { Col, Row } from 'reactstrap';
import { NavLink } from 'react-router-dom';
import { RoomContext } from '../../providers/RoomProvider';
import { Room } from "../rooms/Room";
import './Layout.css';

export const NavBar = () => {
    const { rooms, getRooms } = useContext(RoomContext)
    const currentUser = JSON.parse(sessionStorage.getItem("userProfile"))

    useEffect(() => {        
        getRooms(currentUser.id);        
        // eslint-disable-next-line       
    }, []);
    
    return (
        <>
            <section className="navContainer">
                <Col className="navColumn">
                    <Row className="navRow">
                        <NavLink to="/design">Design a New Room!</NavLink>
                    </Row>

                    <div className="roomContainer">
                        {rooms.map(r =>
                            <Room key={r.id} room={r} />
                        )}
                    </div>

                    <Row className="navRow">
                        <NavLink to="/stockRoom">Stock Room</NavLink>
                    </Row>
                </Col>
            </section>
        </>
    )
}