
  ///////////////////////////////////////////

    class Hero {
        update() {

        }
    };

    class Enemy {
        update() {

        }
    };

  ///////////////////////////////////////////

    class Hero {
        update() {
            // Walk
            // Collect diamonds
        }
    };

    class Enemy {
        update() {
            // Walk
            // Kill heroes
        }
    };

  ///////////////////////////////////////////

    class Hero {
        update() {
            // Walk
            // Collect diamonds
        }
    };

    class Butterfly {
        update() {
            // Walk
            // Be cute
        }
    };

    class Enemy {
        update() {
            // Walk
            // Kill heroes
            // Kill butterflies
        }
    };

  ///////////////////////////////////////////

    class Hero {
        update() {
            // Walk
            // Collect diamonds
        }
    };

    class Butterfly {
        update() {
            // Walk
            // Be cute
            // Collect diamonds
        }
    };

    class Enemy {
        update() {
            // Walk
            // Kill heroes
            // Kill butterflies
        }
    };

  ///////////////////////////////////////////

    class Walk
    class CollectStuff
    class KillStuff

    class Hero extends Walk, CollectStuff {
        update() {
            // Ehhh
        }
    };

  ///////////////////////////////////////////

    class WalkComponent
    class CollectComponent
    class KillComponent

    class Hero {
        components: List[
            new WalkComponent,
            new CollectComponent
        ]

        update() {
            for (component in components) {
                component.update()
            }
        }
    };

  ///////////////////////////////////////////


