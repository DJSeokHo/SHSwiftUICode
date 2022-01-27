import Foundation

public class StringExample {
    
    public init() {}
    
    public func stringTest() {
        let someString = "Some string literal value"
        let quotation = """
        The White Rabbit put on his spectacles.  "Where shall I begin, \
        please your Majesty?" he asked.

        "Begin at the beginning," the King said gravely, "and go on
        till you come to the end; then stop."
        """
        
        print(someString)
        print(quotation)
    }
    
}
