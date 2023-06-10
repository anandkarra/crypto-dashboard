import calendar
import datetime

import constants

def convertDateToUnixTimestamp(date):
    dateWithSuffix = date + constants.startOfDaySuffix
    # print("Converting: ", dateWithSuffix)
    return int(calendar.timegm(datetime.datetime.strptime(dateWithSuffix, constants.datetimeFormat).utctimetuple()))