
def qsort(list):
    if list == []:
        return list

    middle = list.pop(0)
    low  = qsort([ x for x in list if x < middle ])
    high = qsort([ x for x in list if x > middle ])

    return low + [middle] + high


if __name__ == '__main__':
    with open('./q_1_1.data', encoding='utf-8') as a_file:
        list = [int(line.rstrip()) for line in a_file if len(line.rstrip()) > 0]

    result = qsort(list)

    with open('./q_1_1.out', mode='w', encoding='utf-8') as a_file:
        [a_file.write(str(line) + "\n") for line in result]
