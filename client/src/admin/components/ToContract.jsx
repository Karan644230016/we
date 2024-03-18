import React, { useState, useEffect } from 'react';

function ToContract() {
    const [data, setData] = useState([]);
    const [students, setStudents] = useState([]);
    const [actIDCounts, setActIDCounts] = useState({});

    useEffect(() => {
        const fetchData = async () => {
            try {
                const response = await fetch('http://localhost:3333/getManage');
                if (!response.ok) {
                    throw new Error('Failed to fetch data');
                }
                const jsonData = await response.json();
                setData(jsonData);

                // Calculate the count of act_ID
                const counts = jsonData.reduce((acc, item) => {
                    acc[item.act_ID] = (acc[item.act_ID] || 0) + 1;
                    return acc;
                }, {});
                setActIDCounts(counts);
            } catch (error) {
                console.error('Error fetching data:', error);
            }
        };

        const fetchStudents = async () => {
            try {
                const response = await fetch('http://localhost:3333/getStudent');
                if (!response.ok) {
                    throw new Error('Failed to fetch data');
                }
                const jsonData = await response.json();
                setStudents(jsonData);
            } catch (error) {
                console.error('Error fetching student data:', error);
            }
        };

        fetchData();
        fetchStudents();
    }, []);

   

    // Function to render tables based on act_ID
    const renderTables = () => {
        return Object.entries(actIDCounts).map(([act_ID, count]) => {
            const group = data.filter(item => item.act_ID === act_ID);
            return (
                <div key={act_ID} className="mb-16">
                    <h2>Activity ID: {act_ID}</h2>
                    <p>Number of Student: {count}</p>
                    <table className="table">
                        <thead>
                            <tr>
                                <th>Confirm</th>
                                <th>Management ID</th>
                                <th>Activity ID</th>
                                <th>Student ID</th>
                                <th>Name</th>
                                <th>Details</th>
                            </tr>
                        </thead>
                        <tbody>
                            {group.map(item => {
                                // Find the student data based on std_ID
                                const student = students.find(student => student.std_ID === item.std_ID);
                                return (
                                    <tr key={item.man_ID}>
                                        <td>
                                            <label>
                                                <input type="checkbox" className="checkbox" />
                                            </label>
                                        </td>
                                        <td>{item.man_ID}</td>
                                        <td>{item.act_ID}</td>
                                        <td>{item.std_ID}</td>
                                        <td>{student ? `${student.std_fname} ${student.std_lname}` : 'N/A'}</td>
                                        <td>
                                            <button className="btn btn-ghost btn-xs">Details</button>
                                        </td>
                                    </tr>
                                );
                            })}
                        </tbody>
                    </table>
                </div>
            );
        });
    };

    return (
        <div>
            <div className="flex" data-theme="dark">
                <div className="w-1/4 m-4">
                    <div className="rounded-lg border-teal-400 text-center text-4xl font-bold">
                        <h1>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic sit, alias officia nostrum veritatis asperiores ipsam repellendus accusamus sed harum velit numquam, deleniti soluta doloremque repudiandae voluptatem optio tempore earum?</h1>
                    </div>
                </div>
                <div className="w-3/4 m-4">
                    <div className="overflow-x-auto">
                        {renderTables()}
                        <div className="flex justify-center mt-16">
                            <button type="submit" className="btn btn-primary">
                                Submit
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default ToContract;
