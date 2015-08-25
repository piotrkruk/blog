# Blog [![wercker status](https://app.wercker.com/status/c2f59ed2ec45294c9df51f8ea56e189f/s/master "wercker status")](https://app.wercker.com/project/bykey/c2f59ed2ec45294c9df51f8ea56e189f)
This is a simple blog. It allows users to create their own accounts, post articles, comment on them and tag articles to enhance searching.


## Deployment
The project is using wercker for autodeployment.
It's still under development however you can already see production running at:

http://evening-everglades-6181.herokuapp.com


## Features

### Users
Written from scratch sing up and log in using [BCrypt](https://github.com/codahale/bcrypt-ruby) for generating password hash and password salt. Sessions tokens are stored in cookies.

### Articles
Basic blog functionality including browsing, creating, editing and deleting articles.

### Tags
Articles can be tagged with existing tags or new ones can be added. There is also an autocomplete feature for finding desired tag. Front end built with [TagIt](https://github.com/hailwood/jQuery-Tagit).
The most popular tags are listed in the tag cloud.
The articles can be searched by the given tag.

### Comments 
Each article can be commented by users.
