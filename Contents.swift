import Foundation

// 1. დაწერეთ ფუნქცია რომელიც პარამეტრად მიიღებს String-ს და დააბრუნებს ბულიანს. ფუნქციამ უნდა შეამოწმოს მიღებული სტრინგი სარკისებურია თუ არა (სიტყვა ან წინადადება რომელიც იკითხება ერთნაირად როგორც თავიდან, ისე ბოლოდან მაგ: “ანა”, “აირევი ივერია”, “მადამ”)
func palindromeChecker(word: String) -> Bool {
    var reversedString = ""
    for character in word {
        reversedString = String(character) + reversedString
    }
    if word == reversedString {
        return true
    } else {
        return false
    }
}

palindromeChecker(word: "აირევი ივერია")

// 2. დაწერეთ ფუნქცია რომელიც გადაცემულ რიცხვების array-ს ააკვარდატებს, დაპრინტავს და დააბრუნებს მნიშვნელობას.
var numbersToSquare = [5, 10, 15, 20]
func squaringNumbers(in array: [Int]) {
    var answer = [Int]()
    for number in array {
        answer.append(number * number)
    }
    print(answer)
}
squaringNumbers(in: numbersToSquare)

// 3. დაწერეთ Closure რომელიც გაფილტრავს ლუწ რიცხვებს Int-ების Array-დან.
var filterEven: ([Int]) -> [Int] = { givenArray in
    givenArray.filter { $0 % 2 == 0 }
}
print(filterEven([2,3,4,5,6,7,8]))

// 4. დაწერეთ ფუნქცია, რომელიც პარამეტრად იღებს Int-ების მასივს. Escaping closure-ის მეშვეობით დაბეჭდეთ მიწოდებული მასივის ჯამი 5 წამის შემდეგ. დარწმუნდით რომ closure არის escaping და გამოიძახეთ ის მას შემდეგ რაც ფუნქცია დაბრუნდება.
func calculatingTotal(for recieved: [Int], completion: @escaping (Int) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        completion(recieved.reduce(0,+) )
    }
}

calculatingTotal(for: [1,2,3,4,5,6,7,8,9]) { answer in
    print("5 SECONDS HAVE PASSED 🟢 \(answer)")
}
print("\n")

// 5. შექმენით  კონტაქტების Dict სადაც key არის სახელი და value ტელეფონის ნომერი, დაამატეთ, დაბეჭდეთ/მოძებნეთ და წაშალეთ კონტაქტი
var contacts = [
    "Giorgi" : 579184634,
    "Mohammed" : 593479546,
    "Zehmet" : 593394637
]

// დამატება (2 გზით)
contacts["Fatima"] = 598454617
contacts.updateValue(599181839, forKey: "Abdullah")

if let AbdullahNumber = contacts["Abdullah"], let FatimaNumber = contacts["Fatima"] {
    print("დაემატა ორი კონტაქტი: \(AbdullahNumber) და \(FatimaNumber)")
}

// ძიება (2 გზით)
if let giorgiIdentifier = contacts["Giorgi"] {
    print("მოიძებნა \(giorgiIdentifier) ნომერი Key-ს (სახელის) გამოყენებით")
}

if let giorgiSecondIdentifier = contacts.first(where: { $0.value == 579184634 }) {
    print("მოიძებნა \(giorgiSecondIdentifier.key) მისი Value-ს გამოყენებით (ტელ. ნომერი) - \(giorgiSecondIdentifier.value)")
}

// წაშლა
contacts.removeValue(forKey: "Mohammed")
print(contacts.keys) // ვამოწმებთ რომ ნამდვილად წაიშალა Mohammed
print("\n")

// 6. დაწერეთ ფუნქცია რომელიც პარამეტრად იღებს [String: Int] ტიპის Dictionary-ს და დააბრუნებს ანბანურად დალაგებულ dictionary-ს key ელემენტების მასივს.
var exampleDictionary = [
    "B" : 2,
    "A" : 1,
    "C" : 3,
    "E" : 5,
    "D" : 4
]

func sortByAlphabeticalOrder(in dictionary: [String: Int]) -> [String] {
    dictionary.keys.sorted()
}
print(sortByAlphabeticalOrder(in: exampleDictionary))

// 7. შექმენით Double-ების მასივი, შეავსეთ ის თქვენთვის სასურველი რიცხვებით.  loop-ის გამოყენებით იპოვეთ ყველაზე დიდი რიცხვი ამ მასივში და დაბეჭდეთ.
var doubleNumbers = [1.4, 11.6, 32.5, 14.5]
var highestNumber = doubleNumbers[0]

for number in doubleNumbers {
    if number > highestNumber {
        highestNumber = number
    }
}

print("Highest number in an array is",highestNumber)













