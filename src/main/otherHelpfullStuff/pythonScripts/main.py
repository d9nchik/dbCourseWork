from json import load
from random import choice, randrange, randint
import datetime

names = ['Максим', 'Матвій', 'Артем', 'Андрій', 'Олександр', 'Владислав', 'Денис', 'Роман', 'Юрій', 'Дмитро', 'Данило',
         'Богдан', 'Маркіян', 'Олег', 'Максим', 'Максим', 'Максим', 'Максим', 'Софія', 'Анна', 'Анастасія', 'Вікторія',
         'Вероніка', 'Марія', 'Соломія', 'Яна', 'Злата', 'Марта', 'Діана', 'Дарина', 'Юлія', 'Христина', 'Ангеліна']


def get_surnames():
    PATH = 'surnames.json'
    with open(PATH) as f:
        surnames_data = load(fp=f)
        surnames = []
        del surnames_data[0]
        for data in surnames_data:
            surnames.append(data[0])
        return surnames


surnames = get_surnames()


def normalize(string: str) -> str:
    return string[0].upper() + string[1:].lower()


def generate_credentials():
    name = choice(names)
    surname = normalize(choice(surnames))
    return name + ' ' + surname


def generate_date(start_date, end_date):
    time_between_dates = end_date - start_date
    days_between_dates = time_between_dates.days
    random_number_of_days = randrange(days_between_dates)
    return start_date + datetime.timedelta(days=random_number_of_days)


def generate_phone():
    str = '096'
    for x in range(7):
        str += '{}'.format(randint(0, 9))
    return str


if __name__ == '__main__':
    print(generate_date(datetime.date(2000, 1, 1), datetime.date(2010, 12, 31)))
    for x in range(1):
        print(generate_credentials())
        print(generate_date(datetime.date(1960, 1, 1), datetime.date(1990, 12, 31)))
        print(generate_phone())
        print()
