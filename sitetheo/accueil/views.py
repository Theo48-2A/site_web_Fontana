from django.shortcuts import render

def cv_detail(request):
    cv_data = {
        'name': 'Théo Fontana',
        'title': 'Développeur Full Stack',
        'email': 'theofontana@orange.fr',
        'phone': '0769840924',
        'experience': [
            {
                'title': 'Stage Développeur Python',
                'company': 'Michelin Motorsport',
                'date': 'Avril - Septembre 2024',
                'description': "Création d’une application de traitement de données issues de capteurs embarqués sur véhicule.\nTech: Python, PyQt, HTML/CSS/JS, MATLAB, Git, GitLab, SQLite"
            },
            {
                'title': 'Stage Développeur/Bases de Données',
                'company': 'Sol Solution Riom',
                'date': 'Avril - Août 2023',
                'description': "Développement d’un outil multicritères d’interrogation de bases de données.\nTech: Python, PostgreSQL"
            }
        ],
        'education': [
            {'degree': 'Master 2 Génie Logiciel', 'school': 'ISIMA - Université Clermont Auvergne', 'year': '2023/24'},
            {'degree': 'Master 1 Informatique', 'school': 'ISIMA - Université Clermont Auvergne', 'year': '2022/23'},
            {'degree': 'Licence Informatique', 'school': 'Université Clermont Auvergne', 'year': '2021/22'},
        ],
        'skills': ['Python', 'Django', 'Java', 'Spring Boot', 'Golang', 'PostgreSQL', 'Docker', 'React', 'Flutter'],
        'languages': {'Anglais': 'Technique', 'Espagnol': 'Élémentaire', 'Corse': 'Intermédiaire'},
        'projects': [
            {'title': 'Gestion de lieux', 'description': "Application Web/Mobile REST\nBackend : Python (Flask), SQLAlchemy, PostgreSQL\nFrontend : Flutter"},
            {'title': 'Jeu de Dames en Réseau', 'description': "Langage C (Client/Serveur), sockets TCP"},
        ]
    }
    return render(request, 'accueil/cv_detail.html', {'cv': cv_data})
