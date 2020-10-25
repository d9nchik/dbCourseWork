from urllib.request import urlopen
from html.parser import HTMLParser
import json

URL = 'https://sites.google.com/site/uaname/popularnist-prizvis/misca-1---10000'


class MyHTMLParser(HTMLParser):

    def __init__(self, *, convert_charrefs=True):
        super().__init__(convert_charrefs=convert_charrefs)
        self.surnames = []
        self.isContent = False
        self.counter = 0

    def handle_starttag(self, tag, attrs):
        if (('id', 'sites-canvas-main-content') in attrs):
            self.isContent = True
        if self.isContent:
            self.counter += 1

    def handle_endtag(self, tag):
        if self.isContent:
            self.counter -= 1
            if self.counter == 0:
                self.isContent = False

    def handle_data(self, data):
        if self.isContent:
            values = []
            for x in data.split('|'):
                values.append(x.strip())
            if len(values) <= 1:
                return
            del values[0]
            self.surnames.append(values)


def get_text(url: str) -> str:
    text = urlopen(url).read().decode()
    return text


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    text = get_text(URL)
    parser = MyHTMLParser()
    parser.feed(text)
    surnames = parser.surnames
    parser.close()
    with open('surnames.json', 'w') as f:
        json.dump(surnames, indent=2, ensure_ascii=False, fp=f)
