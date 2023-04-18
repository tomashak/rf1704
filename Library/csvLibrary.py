import csv

class csvLibrary(object):
    def filter_csv_file(self, filename, selector):
        data = []
        with open(filename, 'rt') as csvrow:
            reader = csv.reader(csvrow, delimiter=';', quotechar='"')
            for row in reader:
                if selector in str(row):
                    data.append(row)
        return data