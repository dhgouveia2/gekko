# gekko


Compose

```
version: '2'

services:

  postgres:
    image: postgres
    restart: always
    environment:
      - POSTGRES_USER=user
      - POSTGRES_PASSWORD=pass
    volumes:
      - postgres_data:/var/lib/postgresql/data

  gekko:
    image: dhgouveia2/gekko
    restart: always
    volumes:
      - gekko_history:/gekko/history
      - ./config.js:/gekko/config.js
    environment:
     - HOST=0.0.0.0
     - PORT=3101
     - USE_SSL=0
     - MEMORYNODE=512
    ports: 
      - 3101:3101
    depends_on:
      - postgres
volumes:
  gekko_history:
  postgres_data:```
