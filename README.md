# Challenges and Approach

Challenges <br/>
One of the main challenges I encountered was initially lacking a clear understanding of the database schema provided for the assessment. To overcome this, I utilized the reverse engineering feature available in the database option in the menu. This generated an Enhanced Entity Relationship (EER) Diagram, visually representing all tables, their columns, their data types, and primary keys. This visualization was instrumental in establishing relationships between tables, enabling me to write effective join queries throughout the project.

Question 1 Approach </br>
For the first question, I broke down the problem into smaller, manageable parts using Common Table Expressions (CTEs) based on the given conditions. After processing these intermediate results, I joined them with the users_customuser table to produce the final output.

Question 2 Approach </br>
In the second question, I focused on calculating monthly transactions and the average transaction amount per customer. I also segmented customers according to the specified rules. This segmentation ensured that the final query executed smoothly and accurately.

Question 3 Approach </br>
The third question was more straightforward. I selected the required columns while inplementing a systeme to classify customer's savings and investment plan using a CASE statement. Additionally, I retrieved the last transaction date and calsulated the number of inactive days. The data was grouped and ordered according to the instructions provided.

Question 4 Approach </br>
For the fourth question, I decomposed the question into smaller parts and carefully verified the syntax for each calculation before combining everything into a single query. Since all monetary values were stored in kobo, I converted them to Naira by dividing by 100. This was crucial for accurately calculating the average profit per transaction and the estimated Customer Lifetime Value (CLV)
