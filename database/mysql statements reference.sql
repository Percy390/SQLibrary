describe shelf;

insert into shelf (bookcase_id, position)
values (1, 4);

select * from shelf;

insert into book (user_id, shelf_id, isbn, title)
values (1, 1,  9780765326355, 'The Way of Kings: Book One of the Stormlight Archive');

insert into book (user_id, shelf_id, isbn, title)
values (1, 1, 9780142407332, 'The Outsiders'),
(1, 1, 1557427666, 'The Metamorphosis'),
(1, 1, 1501181009, 'The Outsider: A Novel'),
(1, 1, '9780345339683', 'The Hobbit'),
(1, 1, '9780441172719', 'Dune'),
(1, 2, '9780451524935', '1984'),
(1, 2, '9780743273565', 'The Great Gatsby'),
(1, 3, '9780316769488', 'The Catcher in the Rye'),
(1, 4, '9780439136365', 'Harry Potter and the Goblet of Fire'),
(1, 4, '9780061120084', 'To Kill a Mockingbird');

select * from shelf;
select * from book;

select * from book where shelf_id  = 3;

update book set title = 'Brave New World', isbn = 9780060850524 where shelf_id = 3;

delete from book where shelf_id = 3;

select * from book;
