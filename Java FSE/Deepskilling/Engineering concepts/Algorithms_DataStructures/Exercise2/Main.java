public class Main {

    public static void main(String[] args) {

        Product[] products = {

                new Product(101, "Laptop", "Electronics"),
                new Product(102, "Mobile", "Electronics"),
                new Product(103, "Shoes", "Fashion"),
                new Product(104, "Watch", "Accessories"),
                new Product(105, "Bag", "Fashion")

        };

        int searchId = 104;

        Product linearResult = SearchAlgorithms.linearSearch(products, searchId);

        if (linearResult != null) {
            System.out.println("Linear Search Found: " + linearResult);
        } else {
            System.out.println("Product Not Found");
        }

        Product binaryResult = SearchAlgorithms.binarySearch(products, searchId);

        if (binaryResult != null) {
            System.out.println("Binary Search Found: " + binaryResult);
        } else {
            System.out.println("Product Not Found");
        }

        // Time Complexity Analysis
        System.out.println("\nTime Complexity:");
        System.out.println("Linear Search -> Best: O(1), Average: O(n), Worst: O(n)");
        System.out.println("Binary Search -> Best: O(1), Average: O(log n), Worst: O(log n)");
    }
}