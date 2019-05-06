using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Move : MonoBehaviour
{
    public Animator animator;
    public GameObject Target;
    public float speed = 0.5f;
    public float accuracy = 1.5f;
    public float RotationSpeed = 1f;
    // Start is called before the first frame update
    void Start()
    {
        animator = this.gameObject.GetComponent<Animator>();
    }

    // Update is called once per frame
    void LateUpdate()
    {
        Vector3 NewLookAt = new Vector3(Target.transform.position.x, transform.position.y, Target.transform.position.z);
        Vector3 Direction = NewLookAt - transform.position;
        transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(Direction), Time.deltaTime * RotationSpeed);
        if (Vector3.Distance(transform.position, NewLookAt) > accuracy)
        {
            transform.Translate(0, 0, speed * Time.deltaTime);
            animator.SetFloat("Blend", 1f);
        }
        else
        {
            animator.SetFloat("Blend", 0f);
        }
    }
}
