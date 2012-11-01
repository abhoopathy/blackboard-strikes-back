define([], function () {
    return {
        "classes": [
            {
                "id": "1",
                "fullName": "User Centered Research and Evaluation",
                "shortName": "UCRE",
                "sections": [
                    { "name": "Syllabus", "link": "syllabus" },
                    { "name": "Course Documents", "link": "course_docs"  },
                    { "name": "People", "link": "people"  },
                    { "name": "Lectures", "link": "lectures"  },
                    { "name": "Exam Review", "link": "exam_review"  }
                ]
            },
            {
                "id": "2",
                "fullName": "Cognitive Modelling",
                "shortName": "CogMod",
                "sections": [
                    { "name": "Syllabus", "link": "syllabus" },
                    { "name": "People", "link": "people"  }
                ]
            },
            {
                "id": "3",
                "fullName": "Evolution & History of Life",
                "shortName": "Evolution",
                "sections": [
                    { "name": "Syllabus", "link": "syllabus"  },
                    { "name": "Course Documents", "link": "course_docs"  },
                    { "name": "People", "link": "people"  }
                ]
            },
            {
                "id": "4",
                "fullName": "Entrepreneurship for CS",
                "shortName": "Entrepr",
                "sections": [
                    { "name": "Syllabus", "link": "syllabus"  },
                    { "name": "Course Documents", "link": "course_docs"  },
                    { "name": "People", "link": "people"  }
                ]
            },
            {
                "id": "5",
                "fullName": "Interpretation and Argument",
                "shortName": "Interp",
                "sections": [
                    { "name": "Syllabus", "link": "syllabus"  },
                    { "name": "Course Documents", "link": "course_docs"  },
                    { "name": "People", "link": "people"  },
                    { "name": "Links", "link": "links"  }
                ]
            }
        ],

        "tasks": [
            {
                "id": "1",
                "classID": "1",
                "taskName": "Assignment #4",
                "subtext": "Wed 10/17, 11am",
                "status": "active",
                "checked": false
            },
            {
                "id": "2",
                "classID": "4",
                "taskName": "SS HW #3",
                "subtext": "Thu10/18 in class",
                "status": "active",
                "checked": false
            },
            {
                "id": "3",
                "classID": "3",
                "taskName": "Read Ch.11, 12",
                "subtext": "Thu10/18",
                "status": "active",
                "checked": false
            },
            {
                "id": "4",
                "classID": "2",
                "taskName": "Unit1",
                "subtext": "Tues10/16 in class",
                "status": "active",
                "checked": false
            },
            {
                "id": "5",
                "classID": "2",
                "taskName": "SS HW #2",
                "subtext": "Thu10/11 in class",
                "status": "active",
                "checked": false
            },
            {
                "id": "6",
                "classID": "5",
                "taskName": "Assignment #3",
                "subtext": "Wed 10/10, 11am",
                "status": "pending grade",
                "checked": true
            }
        ],

        "months": {
                "10": {
                    "id": 10,
                    "name": "October",
                    "days": "31",
                    "startsOn": "1",
                    "events": [
                    ],
                    "reoccuring": [
                        {
                            "classID": "1",
                            "name": "Lecture",
                            "day": 1,
                            "time": 900
                        },
                        {
                            "classID": "2",
                            "name": "Lecture",
                            "day": 1,
                            "time": 1200
                        },
                        {
                            "classID": "3",
                            "name": "Lecture",
                            "day": 2,
                            "time": 1200
                        },
                        {
                            "classID": "4",
                            "name": "Lecture",
                            "day": 2,
                            "time": 1320
                        },
                        {
                            "classID": "1",
                            "name": "Recitation",
                            "day": 5,
                            "time": 1500
                        },
                        {
                            "classID": "1",
                            "name": "Lecture",
                            "day": 3,
                            "time": 900
                        },
                        {
                            "classID": "2",
                            "name": "Lecture",
                            "day": 3,
                            "time": 1200
                        },
                        {
                            "classID": "3",
                            "name": "Lecture",
                            "day": 4,
                            "time": 1200
                        },
                        {
                            "classID": "4",
                            "name": "Lecture",
                            "day": 4,
                            "time": 1320
                        },
                        {
                            "classID": "5",
                            "name": "Lecture",
                            "day": 3,
                            "time": 1500
                        }
                    ]
                }
        }
    };
});
