SUFFIXES = {1000: ['KB', 'MB', 'GB', 'TB', 'PB'],
            1024: ['KiB', 'MiB', 'GiB', 'TiB', 'PiB']}

def approximate_size(size, a_kilobyte_is_1024=True):
    if size < 0:
        raise ValueError('number must be non negative')

    multiple = 1024 if a_kilobyte_is_1024 else 1000

    for suffix in SUFFIXES[multiple]:
        size = size / multiple
        if size < multiple:
            return '{0:.1f} {1}'.format(size, suffix)

if __name__ == '__main__':
    print(approximate_size(a_kilobyte_is_1024=False, size=10000000))
    print(approximate_size(size=10000000))
