import java.util.*;
public class reverseword
{
public static void main(String x[])
{
Scanner sc=new Scanner(System.in);
int i,j,sp1;
System.out.println("Enter the string");
String ch=sc.nextLine();
int sp2=ch.length;
for(i=ch.length;i>=0;i--)
{
if(ch[i]==' ' || 