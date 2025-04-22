#!/usr/bin/env python3
import argparse
from datetime import date, datetime

def main():
    parser = argparse.ArgumentParser(
                    prog='Timedelta',
                    description='Delta between two dates')
    parser.add_argument("date1")
    parser.add_argument("date2")
    args = parser.parse_args()

    date1 = [x for x in args.date1.split(".") if x != ""]
    date2 = [x for x in args.date2.split(".") if x != ""]
    for splitdate in date1, date2:
        if len(splitdate) == 2:
            splitdate.append(datetime.today().year)
        if len(splitdate) != 3:
            raise Exception("Date must match format day.month[.year]")
    date1 = date(*(int(x) for x in reversed(date1)))
    date2 = date(*(int(x) for x in reversed(date2)))
    delta = date1 - date2
    print(abs(delta.days))

if __name__ == "__main__":
    main()
