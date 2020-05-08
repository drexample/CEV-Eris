//////////////////////////////////
// ROLES 2.0
//////////////////////////////////
// First bit is no/yes.
// Second bit is persistence (save to char prefs).
// Third bit is whether we polled for that role yet.
#define ROLEPREF_ENABLE         1 // Enable role for this character.
#define ROLEPREF_PERSIST        2 // Used to flag a pref as Always/Never
#define ROLEPREF_POLLED         4 // Have we polled this guy?
#define ROLEPREF_SAVE           8 // Flag the pref to be saved permanently.

#define ROLEPREF_NEVER   ROLEPREF_PERSIST
#define ROLEPREF_NO      0
#define ROLEPREF_YES     ROLEPREF_ENABLE
#define ROLEPREF_ALWAYS  (ROLEPREF_ENABLE|ROLEPREF_PERSIST)