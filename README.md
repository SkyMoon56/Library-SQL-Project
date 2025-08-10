# 📚 Library Management System - SQL Analytics Project

A comprehensive SQL project demonstrating data analysis and database management skills through a real-world library management system. This project showcases intermediate SQL techniques including complex joins, aggregations, window functions, and business intelligence queries.

## 🎯 Project Overview

This project analyzes a library database to answer critical business questions about book popularity, member engagement, inventory management, and operational efficiency.

## 🚀 Quick Start

### Prerequisites
- SQL database system (MySQL, PostgreSQL, or SQL Server)
- SQL client tool (MySQL Workbench, pgAdmin, DBeaver, etc.)
- Basic understanding of SQL

## 📁 Project Structure

```
library-management-sql/
│
├── README.md
├── LICENSE
│
├── schema/
│   └── create_tables.sql       # Database schema definition
│
├── data/
│   └── sample_data.sql         # Sample data (20 members, 30 books, 50+ loans)
│
├── queries/
│   ├── 01_popular_books.sql    # Most borrowed books analysis
│   ├── 02_member_activity.sql  # Member borrowing patterns
│   ├── 03_category_analysis.sql # Book category performance
│   ├── 04_overdue_books.sql    # Currently overdue books
│   ├── 05_monthly_trends.sql   # Library usage trends
│   ├── 06_top_readers.sql      # Most active members
│   ├── 07_book_availability.sql # Real-time inventory status
│   ├── 08_author_analysis.sql  # Author popularity metrics
│   ├── 09_age_groups.sql       # Demographics analysis
│   └── 10_fines_report.sql     # Fine collection tracking
│
├── reports/
│   └── executive_dashboard.sql # KPI dashboard query
│
└── docs/
    ├── erd_diagram.png         # Entity Relationship Diagram
    └── data_dictionary.md      # Table and column descriptions
```

## 🗄️ Database Schema

### Tables
- **`members`** - Library member information (20 records)
- **`books`** - Book catalog with inventory (30 records)
- **`loans`** - Book borrowing transactions (50 records)
- **`reviews`** - Member book reviews and ratings (30 records)
- **`reservations`** - Book reservation queue (15 records)

### Key Relationships
- Members can have multiple loans and reviews
- Books can have multiple loans, reviews, and reservations
- Each loan links one member to one book
- Reviews require both a member and a book

## 📊 Featured Analyses

### 1. **Book Popularity Metrics**
- Most borrowed books
- Average ratings by title
- Correlation between loans and ratings

### 2. **Member Engagement**
- Active vs. inactive members
- Borrowing frequency patterns
- Late return analysis

### 3. **Inventory Management**
- Real-time availability tracking
- High-demand book identification
- Reservation queue analysis

### 4. **Financial Reporting**
- Fine collection tracking
- Outstanding balance reports
- Revenue by membership type

### 5. **Demographic Insights**
- Reading preferences by age group
- Category popularity by member type
- Geographic distribution analysis

## 💡 SQL Techniques Demonstrated

- **Joins**: INNER, LEFT, RIGHT, and self-joins
- **Aggregations**: COUNT, SUM, AVG, MAX, MIN
- **Window Functions**: RANK(), ROW_NUMBER(), LAG()
- **CTEs**: Common Table Expressions for complex queries
- **Subqueries**: Correlated and non-correlated
- **Date Functions**: Date arithmetic and formatting
- **CASE Statements**: Conditional logic in queries
- **GROUP BY with HAVING**: Advanced filtering
- **String Operations**: Concatenation and manipulation

## 📈 Sample Insights

Based on the sample data, the system can answer questions like:

- **Q: Which books have the longest waiting lists?**
  - A: "Harry Potter" series with 3+ active reservations

- **Q: What's the average loan duration?**
  - A: 14 days, with students keeping books longest

- **Q: Which categories generate the most fines?**
  - A: Fiction books, due to their popularity and longer reading times

- **Q: What percentage of members are active?**
  - A: 75% have borrowed in the last 3 months

## 🛠️ Technologies Used

- SQL (MySQL/PostgreSQL/SQL Server compatible)
- Database design and normalization
- Data analysis and reporting
- Business intelligence queries

## 📝 How to Use This Project

### For Learning:
1. Start with simple SELECT queries on individual tables
2. Progress to JOIN operations between related tables
3. Try modifying existing queries to answer new questions
4. Create your own analytical queries

### For Portfolio:
1. Fork this repository
2. Add your own custom queries
3. Create visualizations using the query results
4. Document your insights and findings

### For Interviews:
- Review the query patterns for common interview questions
- Practice explaining the business logic behind each query
- Be ready to optimize queries for performance
- Understand the trade-offs in database design decisions

## 🎯 Business Value

This project demonstrates ability to:
- Transform business requirements into SQL queries
- Analyze data to provide actionable insights
- Design efficient database schemas
- Handle real-world data scenarios (late returns, reservations, etc.)
- Create reports for different stakeholders

## 🔄 Future Enhancements

- [ ] Add stored procedures for common operations
- [ ] Implement triggers for automatic fine calculation
- [ ] Create materialized views for performance
- [ ] Add data validation constraints
- [ ] Include more complex analytical queries
- [ ] Add Python/R integration for advanced analytics
- [ ] Create a web dashboard for visualization

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📫 Contact

Sky Moon - [sky.moon7567@gmail.com](mailto:sky.moon7567@gmail.com)

LinkedIn: [linkedin.com/in/sky-moon/](https://linkedin.com/in/sky-moon/)

Project Link: [github.com/SkyMoon56/Library-SQL-Project](https://github.com/SkyMoon56/Library-SQL-Project)

## 🙏 Acknowledgments

- Inspired by real library management systems
- Sample data includes popular books and authors
- Query patterns based on common business requirements

---

**Note**: This is an educational project with synthetic data. All member information and transactions are fictional and for demonstration purposes only.
[https://sqlplayground.app/sandbox/6898d06fd5bcbd2b3e8c1356](https://sqlplayground.app/sandbox/6898d06fd5bcbd2b3e8c1356)

## ⭐ Show your support

Give a ⭐️ if this project helped you prepare for interviews or learn SQL!
