package test;

import java.util.Scanner;
public class SommaNumeri {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Inserisci il primo numero: ");
		int num1 = scanner.nextInt();
		
		System.out.print("Inserisci il secondo numero: ");
		int num2 = scanner.nextInt();
		
		int somma = num1 + num2;
		System.out.println("La somma è: " + somma);
		scanner.close();
	}
}