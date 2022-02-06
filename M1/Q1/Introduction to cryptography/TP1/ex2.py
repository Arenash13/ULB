import string
from itertools import chain, product

def bruteforce(charset, maxlength):
    return (''.join(candidate)
        for candidate in chain.from_iterable(product(charset, repeat=i)
        for i in range(1, maxlength + 1)))

if __name__ == "__main__":
    ciphered = list("Fbzr crbcyr jrne Fhcrezna cnwnznf. Fhcrezna jrnef Puhpx Abeevf cnwnznf.")
    for attempt in bruteforce(string.ascii_lowercase, 10):
        test = ciphered.copy()
        for ind, ch in enumerate(ciphered):
            if ch.isalpha:
                if ch != 'z':
                    test[ind] = chr(ord(ch) + ord(attempt[ind % len(attempt)]) - 96)
                else:
                    test[ind] = 'a'
        print(attempt)
        if 'the' in "".join(test): #and 'of' in "".join(test): # or 'to' in "".join(test):
            print("".join(test))
            
            