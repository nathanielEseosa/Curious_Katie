
// The Enum that hold all participant interest
enum InterestType: String {
    case boxing = "Boxing"
    case swimming = "Swimming"
    case football = "Football"
    case coding = "Coding"
    case gaming = "Gaming"
    case chess = "Chess"
    case paintball = "Paintball"
    case baking = "Baking"
    case hiking = "Hiking"
    case running = "Running"
    case basketball = "Basketball"
    case baseball = "Baseball"
    case mma = "MMA"
    case snowboarding = "Snowbarding"
    case skateboarding = "Skateboarding"
}

// The structure of the participant data
struct ParticipantData {
    var name: String
    var age: Int
    var hometown: String
    var interest = [InterestType]()
}

// The structure of two participants that will become a pair
struct ParticipantPairData {
    var participant1: String
    var participant2: String
}


// An array of participant pairs
var participantsWithPairsDB = [ParticipantPairData]()


class ParticipantBank {
    // An array that stores all participants before they are randomly choosen.
    var listOfAllParticipants = [ParticipantData]()
    
    // An array that stores the randomly choosen participants.
    var listOfChoosenParticipants = [ParticipantData]()
    
    // Adding all participants to the "listOfAllParticipants" array. Later on this list will be shuffled and participant will be randomly picked from it.
    func addAllParticipantToList() {
        
        listOfAllParticipants.append(ParticipantData(name: "John", age: 23, hometown: "Berlin", interest: [.chess, .swimming, .boxing]))
        listOfAllParticipants.append(ParticipantData(name: "Lydia", age: 45, hometown: "Frankfurt", interest: [.football, .boxing]))
        listOfAllParticipants.append(ParticipantData(name: "Becky", age: 34, hometown: "Hamburg", interest: [.hiking, .gaming, .paintball]))
        listOfAllParticipants.append(ParticipantData(name: "Nathaniel", age: 31, hometown: "Berlin", interest: [.coding, .chess, .swimming, .running]))
        listOfAllParticipants.append(ParticipantData(name: "Luke", age: 54, hometown: "New York", interest: [.skateboarding, .chess, .mma]))
        listOfAllParticipants.append(ParticipantData(name: "Erik", age: 33, hometown: "Duisburg", interest: [.paintball, .chess, .swimming, .baking, .gaming]))
        listOfAllParticipants.append(ParticipantData(name: "Jim", age: 24, hometown: "Cologne", interest: [.boxing, .football, .hiking]))
        listOfAllParticipants.append(ParticipantData(name: "Fransika", age: 43, hometown: "Frankfurt", interest: [.basketball, .hiking, .running]))
        listOfAllParticipants.append(ParticipantData(name: "Zlatan", age: 44, hometown: "Brussel", interest: [.coding, .snowboarding, .gaming]))
        listOfAllParticipants.append(ParticipantData(name: "Mike", age: 25, hometown: "Brandenburg", interest: [.boxing, .baseball, .mma]))
        listOfAllParticipants.append(ParticipantData(name: "Joe", age: 42, hometown: "Texas", interest: [.coding, .chess, .swimming]))
        listOfAllParticipants.append(ParticipantData(name: "Hector", age: 24, hometown: "Athen", interest: [.chess, .gaming]))
    }
    
    
    
    // This method generates a random amount (2-12 participants) of participants:
    func generateEvenNumberOfParticipants() {
        
        // 1. Shuffles the "listOfAllParticipants" array.
        listOfAllParticipants = listOfAllParticipants.shuffled()
        
        // 2. Generate a random number that will represent the total amount of participants. Note: There must be at least two participants. That is why the range begins from 1 which mean 2 in the context of index counting [0,1...].
        var randomParticipantNumber = Int.random(in: 1...listOfAllParticipants.count - 1)
        
        
        // 3. The total amount of participants must be an even number so that every pariticipant can have a pair. This statment makes sure there is always an even number of participants n the context of index counting [0,1...]. Note: An uneven number in human logic is even in index logic.
        if randomParticipantNumber % 2 == 0 {
            //1 is added to "randomParticipantNumber" to ensure that the iteration variable "number" goes through the range in an even amount of time.
            randomParticipantNumber += 1
        }
        
        // 4. The loop appends the participants from the shuffled array "listOfAllParticipants" to the "listOfChoosenParticipants" array. The amount of the loop iteration depends on the "randomParticipantNumber" value.
        for number in 0...randomParticipantNumber {
            listOfChoosenParticipants.append(listOfAllParticipants[number])
        }
    }
}

// An object/instance of the ParticipantBank
let participantBank = ParticipantBank()

// Calling the addParticipantToList method to add the participants to the list
participantBank.addAllParticipantToList()

// Calling the generateEvenNumberOfParticipants method to generate a number of participants (2-12 participants)
participantBank.generateEvenNumberOfParticipants()

var participantList = participantBank.listOfChoosenParticipants



print("Participants Introduction")
print("==========================\n")

// The function for introducing the participants
func introduceParticipants() {
    
    for participant in participantList {
        print("My name is \(participant.name). I am \(participant.age) years old and hometown is \(participant.hometown).")
    }
}

// Introducing each participant by calling the introduceParticipants function
introduceParticipants()
print("\n")

print("Participants Interests")
print("==========================\n")

// The function that log the participant interests
func shareInterest() {
    for participant in participantList {
        print("I am \(participant.name). My interests are:")
        for participantInterest in participant.interest {
            print(participantInterest)
        }
        print("\n")
    }
}

shareInterest()

print("Participants Pairing")
print("==========================\n")

// The function that generates the pairs
func generatePairs() {
    for (index, _) in participantList.enumerated() {
        let firstParticipant = participantList[index]
        
        for partcipantData1 in index + 1..<participantList.count {
            let secondParticipant = participantList[partcipantData1]
            
            for participantInterest in firstParticipant.interest {
                
               
                if secondParticipant.interest.contains(participantInterest) {
                    
                    var alreadyFoundAPair: Bool = false
                    // This loops checks if the participants are already pairs.
                    for participant in participantsWithPairsDB {
                        if participant.participant1 == firstParticipant.name || participant.participant1 == secondParticipant.name || participant.participant2 == firstParticipant.name || participant.participant2 == secondParticipant.name {
                            
                            alreadyFoundAPair = true
                            break
                        }
                    }
                    // Set the student1 and student2 value to firststudent.name and secondStudent.name
                    if !alreadyFoundAPair {
                        ParticipantPairData(participant1: firstParticipant.name, participant2: secondParticipant.name)
                        
                        let newParticipantPair = ParticipantPairData(participant1: firstParticipant.name, participant2: secondParticipant.name)
                        participantsWithPairsDB.append(newParticipantPair)
                    }
                }
            }
        }
    }
}

generatePairs()


// The loop is used to log the pairs
for particpant in participantsWithPairsDB {
    print("\(particpant.participant1) and \(particpant.participant2)")
}


